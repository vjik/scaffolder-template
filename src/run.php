<?php

declare(strict_types=1);

use Vjik\Scaffolder\Runner;

require_once __DIR__ . '/../vendor/autoload.php';

new Runner(
    require __DIR__ . '/changes.php',
    require __DIR__ . '/facts.php',
    require __DIR__ . '/defaults.php',
)->run();
