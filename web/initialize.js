window.addEventListener('load', function(ev) {
  // Download main.dart.js
  _flutter.loader.loadEntrypoint({
    serviceWorker: {
      serviceWorkerVersion: null,
    },
    onEntrypointLoaded: function(engineInitializer) {
      engineInitializer.initializeEngine().then(function(appRunner) {
        appRunner.runApp();
      });
    }
  });
});
