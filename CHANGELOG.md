## 0.5.0 2021-12-01

- Compatibility for Haml v5.2

- Support Sprockets 4.0

## 0.4.6 2019-07-13

- Add support for Opal v1.0

## 0.4.5 2018-03-19

- Avoid warning from Opal v0.11

## 0.4.4 2017-05-13

- Improve support for the attribute builder

## 0.4.3 2017-05-02

- Add support for Haml v5.0

## 0.4.2 2016-10-06

- Avoid Sprockets v3.7 deprecations

## 0.4.1 2015-11-02

- Add support for nested attribute hashes: `%div{ data: { foo: 123 } }` now becomes `<div data-foo="123"></div>`.

- Attribute values are now properly escaped.

## 0.4.0 2015-08-07

- Add support for Opal 0.8.

- Update the processor to reuse the good stuff from the Opal::Processor.

- Now each compiled template automatically requires `opal-haml` with the new module system.

## 0.3.0 2015-02-03

- Add support for new opal Builder processors.

- Implicitly require `opal-haml` when any haml template is required

- Cleanup generated code to be use Opal ERB runtime directly.

## 0.2.0 2013-12-17

- Remove opal-sprockets dependency

## 0.1.0 2013-12-17

- Initial release
