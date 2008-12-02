#
# Author:: Adam Jacob (<adam@opscode.com>)
# Copyright:: Copyright (c) 2008 OpsCode, Inc.
# License:: GNU GPL, Version 3
#
# Copyright (C) 2008, OpsCode Inc. 
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

require_plugin "kernel"
require_plugin "os"

hardware_model from('uname -m')

case kernel
when "Linux"
  case hardware_model
   when 'x86_64'
     if os == "Debian" 
        architecture "amd64"
     else
        architecture "x86_64"
     end
  when /(i[3456]86|pentium)/
    architecture "i386"
  end
else
  architecture hardware_model
end