export interface WebviewPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
