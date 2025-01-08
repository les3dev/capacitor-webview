import { WebPlugin } from '@capacitor/core';

import type { WebviewPlugin } from './definitions';

export class WebviewWeb extends WebPlugin implements WebviewPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
