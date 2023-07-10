import 'flavor_model.dart';

const flavorKey = 'FLAVOR';
const launchJsonPath = './.vscode/launch.json';
const settingsJsonPath = './.vscode/settings.json';
const workspaceXmlPath = './.idea/workspace.xml';

const flavorsList = [
  Flavor(flavorEnum: FlavorsEnum.develop, name: 'develop', prefix: 'DEV', envPath: './config/develop.env'),
  Flavor(flavorEnum: FlavorsEnum.qa, name: 'qa', prefix: 'QA', envPath: './config/qa.env'),
  Flavor(flavorEnum: FlavorsEnum.staging, name: 'staging', prefix: 'STG', envPath: './config/staging.env'),
  Flavor(flavorEnum: FlavorsEnum.production, name: 'production', prefix: 'PROD', envPath: './config/production.env'),
];
