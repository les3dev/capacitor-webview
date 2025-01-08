import { registerPlugin } from '@capacitor/core';

import type { WebviewPlugin } from './definitions';

const Webview = registerPlugin<WebviewPlugin>('Webview', {
  web: () => import('./web').then((m) => new m.WebviewWeb()),
});

export * from './definitions';
export { Webview };
