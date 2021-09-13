abstract class PageLoadingStatus {
  const PageLoadingStatus();
}

class InitialPageLoadingStatus extends PageLoadingStatus {
  const InitialPageLoadingStatus();
}

class PageIsLoading extends PageLoadingStatus {}

class LoadingSuccess extends PageLoadingStatus {}

class LoadingFailed extends PageLoadingStatus {
  final Exception exception;
  
  LoadingFailed(this.exception);
}
