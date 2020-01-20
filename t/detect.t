# Copyright 2020 Yoshihiro Tanaka
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#
# Author: Yoshihiro Tanaka <contact@cordea.jp>
# date  : 2020-01-17

use utf8;
use strict;
use warnings;

use Test::Simple tests => 7;

use Detector;

ok(Detector::detect("123456789") == 0);
ok(Detector::detect("perl") == 0);
ok(Detector::detect("あいうえお。") == 0);
ok(Detector::detect("亜唖娃湾碗腕、") == 0);
ok(Detector::detect("弌丐丕瑤凜熙") == 1);
ok(Detector::detect("亜唖娃弌碗腕") == 1);
ok(Detector::detect("弌腕。") == 1);
