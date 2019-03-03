! ** Mean square displacement ** !
SUBROUTINE msd(r,r0,r_old,N,L,mean,sigma,eps,mass,time)
implicit none
real(8) :: r(N,3),r_old(N,3),dx,dy,dz,d2,L,r0(N,3),dr(N,3),rp(N,3),mean
real(8) :: sigma,eps,mass,time
integer :: N,i,j
open(18,file='v_verlet_2_msd.txt')
!r0 reference configuration
!r_old positions at t-dt
!r positions at t
mean=0d0

rp=r !Change the vector to avoid overwrite

do i=1,N
  dx=rp(i,1)-r0(i,1)
  dx=dx-nint(dx/L)*L !Correction of distance according to PBC
  dy=rp(i,2)-r0(i,2)
  dy=dy-nint(dy/L)*L
  dz=rp(i,3)-r0(i,3)
  dz=dz-nint(dz/L)*L
  d2=dx**2d0+dy**2d0+dz**2d0
  mean=mean+d2
end do
mean=mean/N
write(18,*) time*sqrt(mass/eps)*sigma*1d12,mean*(sigma*1d10)**2d0
ENDSUBROUTINE msd