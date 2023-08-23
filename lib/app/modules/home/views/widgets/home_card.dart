part of '../home_view.dart';

class _SurveyCard extends StatelessWidget {
  _SurveyCard({Key? key}) : super(key: key);

  final _controller = HomeController.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          CarouselSlider(
            items: _controller.images
                .map(
                  (itemData) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Stack(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(20),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: InkWell(
                            onTap: () {
                              AppSnackbar.showWarningInfo(
                                title: 'Unavailable',
                                message: 'This feature is still unavailable',
                              );
                            },
                            child: Ink.image(
                              image: NetworkImage(itemData.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 0.90,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, reason) =>
                  _controller.updateBannerIndex(index),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Obx(
              () => AnimatedSmoothIndicator(
                activeIndex: _controller.bannerIndex.value,
                count: _controller.images.length,
                effect: const JumpingDotEffect(
                  activeDotColor: AppColors.blue,
                  dotColor: Color(0xFFE6E6E6),
                  dotWidth: 8,
                  dotHeight: 8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
