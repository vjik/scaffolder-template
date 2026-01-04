# PHP Scaffolder Template

A template for creating your own scaffolder tool using the [vjik/scaffolder](https://github.com/vjik/scaffolder)
library. This template provides a ready-to-use structure for building automated project file modification tools.

## What is this?

This is a starting point for creating custom scaffolder tools that can:

- Automate project initialization
- Generate boilerplate code
- Apply consistent file structures
- Update configuration files
- Copy template files
- Prompt users for project details

## Getting Started

> [!NOTE]
> [PHPTG Scaffolder](https://github.com/phptg/scaffolder) - a real-world example of a scaffolder tool built using this 
> framework.

1. Create a new project based on this template:

```bash
composer create-project vjik/scaffolder-template my-scaffolder
cd my-scaffolder
```

2. Customize the scaffolder (see [Project Structure](#project-structure) below).

3. Run your scaffolder:

```bash
php src/run.php
```

Or if you want to apply changes to a specific directory:

```bash
php src/run.php --directory=/path/to/project
```

## Project Structure

```
.
├── src/
│   ├── run.php         # Entry point - runs the scaffolder
│   ├── changes.php     # List of changes to apply
│   ├── facts.php       # List of custom facts
│   ├── params.php      # Default parameters
│   ├── Change/         # Custom Change classes (optional)
│   └── Fact/           # Custom Fact classes (optional)
├── files/              # Template files to copy
```

### Where to Add What

#### 1. `src/changes.php` - Define What Changes to Apply

This file returns an array of `Change` instances that will be executed in order:

```php
<?php

use Vjik\Scaffolder\Change;

return [
    // Write a README file
    new Change\WriteFile('README.md', 'Hello World'),

    // Copy a file from templates
    new Change\CopyFile(
        from: __DIR__ . '/../files/LICENSE',
        to: 'LICENSE',
    ),

    // Update composer.json with package info
    new Change\PrepareComposerJson(),

    // Create directory with .gitkeep
    new Change\EnsureDirectoryWithGitkeep('src'),
];
```

#### 2. `src/facts.php` - Register Custom Facts

This file returns an array of custom `Fact` classes:

```php
<?php

return [
    // Add your custom Fact classes here
    // MyFact::class,
];
```

#### 3. `src/params.php` - Set Default Parameters

This file returns an array of default parameter values:

```php
<?php

return [
    'package-vendor' => 'myvendor',
    'php-constraint-suggestion' => '8.2 - 8.5',
    'tests-directory' => 'tests/',
    'source-directory' => 'src/',
];
```

Users can override these in their `scaffolder.php` project file or via CLI options.

## Documentation

For detailed information about the library features:

- [vjik/scaffolder](https://github.com/vjik/scaffolder)

If you have any questions or problems with this template, use [author telegram chat](https://t.me/predvoditelev_chat)
for communication.

## License

The `vjik/scaffolder-template` is free software. It is released under the terms of the BSD License.
Please see [`LICENSE`](./LICENSE) for more information.
