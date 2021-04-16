# Лабораторный практикум - плата RZ-easyFPGA

Набор проектов для ознакомления с ресурсами учебной отладочной платы RZ-easyFPGA.
Основной элемент платы - микросхема FPGA семейства Altera (Intel) Cyclone IV, модель EP4CE6E22.
Подробное описание ресурсов платы, используемой микросхемы FPGA и приемов работы с платой можно найти в [Wiki](https://github.com/kdg-auts/RZ-easyFPGA/wiki).

## lab0 - Ознакомительная лабораторная работа

**Цель работы:** ознакомление со средой проектирования (Intel Quartus Prime Lite), освоение типового процесса проектирования цифровой системы под необходимое семейство ПЛИС FPGA (Cyclone IV) на примере реализации подстановочного блока для алгоритма шифрования ГОСТ 28147-89; научиться описывать простые устройства комбинацинного типа на языке VHDL. 

**Задачи:**
1. Теоретическая разработка решения, подготовка описания на языке VHDL.
1. Создание и поддержка проекта, задание настроек и параметров.
1. Ввод описаний и управление исходным кодом проекта.
1. Организация процессов моделирования и функциональной верификации разработанных решений.
1. Настройка и выполнение всех технологических процессов синтеза. Задание проектных ограничений.
1. Подготовка и выполнение процесса конфигурирования ПЛИС на отладочной плате. Создание перманентной конфигурации (запись конфигурации в служебную энергонезависимую память FLASH).

**Задействованные ресурсы:**
* 4 кнопки
* 4 светодиода



## lab1 - Работа с простейшими ресурсами ввода/вывода

**Цель работы:** научиться правильно обрабатывать ввод данных с кнопок и обеспечивать различные режимы индикации на светодиодах; научиться описывать устройства с внутренними состояниями: автоматы, счетчики

**Задачи:**
1. Реализовать модуль считывания данных с набора пользовательских кнопок на отладочной плате с учетом дребезга контактов. Модуль должен распознавать кратковременные и долговременные нажатия, вырабатывать сигналы событий "нажатие" и "отпускание" кнопки. Не зависимо от схемы подключения кнопки к выводу ПЛИС, сигнал о нажатии должен выдаваться в прямой логике (1 - кнопка нажата, 0 - кнопка не нажата)
1. Реализовать модуль вывода сигналов на светодиоды с несколькими режимами отображения: светодиод подсвечивается постоянно, светодиод работает в мигающем режиме с низкой частотой мигания (с периодом около секунды) и с высокой частотой мигания (период около 100 миллисекунд)

**Задействованные ресурсы:**
* 4 кнопки
* 4 светодиода



## lab2 - Работа с звукоизлучателем

**Цель работы:** научиться работать с активным и пассивным звукоизлучателем; научиться формировать различные варианты звуковых сигналов; научиться повторно использовать ранее описанные модули

**Задачи:**
1. Реализовать модуль формирования различных видов звуковых сигналов: кратковременный, длительный, двойной кратковременный.
1. Интегрировать разработанные ранее модули для кнопок и светодиодов в проект с звукоизлучателем 

**Задействованные ресурсы:**
* 4 кнопки
* 4 светодиода
* пьезоэлектрический звукоизлучатель



## lab3 - Работа с семисегментным символьно-цифровым светодиодным индикатором

**Цель работы:** 

**Задачи:**

**Задействованные ресурсы:**



## lab4 - Работа с универсальным портом последовательной передачи данных (UART)

**Цель работы:** 

**Задачи:**

**Задействованные ресурсы:**



## lab5 - Работа с микросхемой энергонезависимой памяти (EEPROM)

**Цель работы:** 

**Задачи:**

**Задействованные ресурсы:**