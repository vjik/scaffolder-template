<?php

declare(strict_types=1);

use Vjik\Scaffolder\Change;
use Vjik\Scaffolder\Fact;
use Vjik\Scaffolder\Runner;

require_once __DIR__ . '/../vendor/autoload.php';

/** @var list<Change> $changes */
$changes = require __DIR__ . '/changes.php';

/** @var list<class-string<Fact<*>>> $facts */
$facts = require __DIR__ . '/facts.php';

/** @var array<string, mixed> $params */
$params = require __DIR__ . '/params.php';

new Runner($changes, $facts, $params)->run();
