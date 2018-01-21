c this is <time_mul.f> (extracted from ../libtime.f)
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
c multiply relative time value by integer
c
c REVISIONS and CHANGES
c    05/08/2000   V1.0   Thomas Forbriger
c                 V2.0   call language specific fatal error handler
c    05/12/2007   V2.1   correction in variable declaration
c
c ============================================================================
cS
      subroutine time_mul(date1, date2, n)
c
c Multiply relative time date1 by n and store result in date2.
c
c input:
c   date1:  relative time record
c   n:      integer factor
c output:
c   date2:  date1*n     (regularized relative time value)
c
c last change: V2.00 (05/08/2000)
c
      integer date1(7), date2(7), n
cE
      integer quotient(7), rest(7), product(7), carry(7), i, limit(7)
      integer help
      data limit/-1,-1,24,60,60,1000,1000/
c
      if (date1(1).ne.0) then
        call time_util_fatal('time_mul','no absolute time allowed')
      else
        do i=3,7
c split n to avoid conflicts with integer range
          quotient(i)=int(n/limit(i))
          rest(i)=n-limit(i)*quotient(i)
          help=int(rest(i)*date1(i)/limit(i))
          carry(i)=quotient(i)*date1(i)+help
          product(i)=rest(i)*date1(i)-help*limit(i)
        enddo
        product(2)=n*date1(2)
        do i=2,6
          date2(i)=product(i)+carry(i+1)
        enddo
        date2(7)=product(7)
        date2(1)=0
        call time_norm(date2)
      endif
      return
      end
c
c ----- END OF <time_mul.f> -----