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

package Detector;

use strict;
use warnings;

use Encode;

my $first_level_kanji = qr/^(?:\x81[\x40-\xAC](?# signs)|\x88[\x9F-\xFC]|[\x89-\x97][\x40-\xFC]|\x98[\x40-\x72](?# first-level kanjis))+$/;

sub detect {
    my $line = shift;
    my $hans = join("", $line =~ /(\p{Han}+)/g);
    unless ($hans) {
        return 0;
    }
    my $sjis = encode("sjis", $hans);
    unless ($sjis =~ $first_level_kanji) {
        return 1;
    }
    return 0;
}

1;
