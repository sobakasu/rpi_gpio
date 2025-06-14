/*
Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

#include "ruby.h"
#include "soft_pwm.h"
#include "common.h"
#include "c_gpio.h"

void define_pwm_class_stuff(void);
VALUE PWM_initialize(VALUE self, VALUE channel, VALUE frequency);
VALUE PWM_start(VALUE self, VALUE duty_cycle);
VALUE PWM_get_gpio(VALUE self);
VALUE PWM_get_duty_cycle(VALUE self);
VALUE PWM_set_duty_cycle(VALUE self, VALUE duty_cycle);
VALUE PWM_get_frequency(VALUE self);
VALUE PWM_set_frequency(VALUE self, VALUE frequency);
VALUE PWM_stop(VALUE self);
VALUE PWM_get_running(VALUE self);
