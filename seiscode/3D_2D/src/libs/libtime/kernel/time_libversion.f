c this is <time_libversion.f> (extracted from ../libtime.f)
c automatically generated by "SPLITF.PL   V1.0   SPLIT Fortran source code"
c----------------------------------------------------------------------
c
c Copyright 2000 by Thomas Forbriger (IfG Stuttgart)
c
c ----
c libtime is free software; you can redistribute it and/or modify
c it under the terms of the GNU General Public License as published by
c the Free Software Foundation; either version 2 of the License, or
c (at your option) any later version. 
c 
c This program is distributed in the hope that it will be useful,
c but WITHOUT ANY WARRANTY; without even the implied warranty of
c MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
c GNU General Public License for more details.
c 
c You should have received a copy of the GNU General Public License
c along with this program; if not, write to the Free Software
c Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
c ----
c
c return the current version of the libtime FORTRAN kernel
c
c REVISIONS and CHANGES
c    05/08/2000   V1.0   Thomas Forbriger
c    05/08/2000   V2.0   extracted from libtime.f
c    07/11/2017   V2.1   increase version number after bug fix in
c                        time_norm
c
c ============================================================================
cS
      real function time_libversion()
c
c returns the current version of the FORTRAN library kernel
c
c last change: V2.10 (07/11/2017)
c
cE
      real version
      parameter(version=2.10)
      time_libversion=version
      return
      end
c
c ----- END OF <time_libversion.f> -----