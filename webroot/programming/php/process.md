# Процессы и задачи

## Doorman

https://github.com/asyncphp/doorman

Child process management. Compatible from PHP 5.3 to PHP 7. Needs no extensions.

### Usage

```php
use AsyncPHP\Doorman\Manager\ProcessManager;
use AsyncPHP\Doorman\Task\ProcessCallbackTask;

$task1 = new ProcessCallbackTask(function () {
    print "in task 1";
});

$task2 = new ProcessCallbackTask(function () {
    print "in task 2";
});

$manager = new ProcessManager();

$manager->addTask($task1);
$manager->addTask($task2);

while ($manager->tick()) {
    usleep(250);
}
```
