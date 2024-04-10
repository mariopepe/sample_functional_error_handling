import 'package:meetup_app/domain/home/todo_failure.dart';
import 'package:meetup_app/presentation/l10n/app_localizations.g.dart';

extension TodoFailureL10n on TodoFailure {
  String toErrorMessage(AppLocalizations l10n) => when(
        noInternetConnection: () => "noInternetConnection",
        serverError: () => "serverError",
        unexpected: () => "unexpected",
      );
}
