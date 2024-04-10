import 'package:flutter/widgets.dart';
import 'package:meetup_app/presentation/l10n/app_localizations.g.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
