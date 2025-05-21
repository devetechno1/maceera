import 'package:flutter/material.dart';
import '../constants/app_dimensions.dart';
import '../data_model/popup_banner_model.dart';
import '../services/navigation_service.dart';

class PopupBannerDialog extends StatelessWidget {
  final PopupBannerModel popupBannerModel;
  const PopupBannerDialog({super.key, required this.popupBannerModel});
  @override
  Widget build(BuildContext context) {
    return Align(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            maxWidth: AppDimensions.constrainedBoxDefaultWidth),
        child: Dialog(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      popupBannerModel.image ?? '',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: AppDimensions.paddingsmall,
                    right: AppDimensions.paddingsmall,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.close, size: 15),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.paddingDefualt),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingDefualt),
                child: Text(
                  popupBannerModel.title ?? '',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: AppDimensions.paddingsmall),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingDefualt),
                child: Text(
                  popupBannerModel.summary ?? '',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: AppDimensions.paddingDefualt),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingDefualt,
                    vertical: AppDimensions.paddingsupsmall),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    NavigationService.handleUrls(popupBannerModel.btnLink);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(
                        double.infinity, AppDimensions.paddingveryLarge),
                    backgroundColor: popupBannerModel.btnBackgroundColor,
                    shape: const RoundedRectangleBorder(),
                  ),
                  child: Text(
                    popupBannerModel.btnText ?? '',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
