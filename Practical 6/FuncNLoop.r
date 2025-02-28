# Write a function to find mean of a sequence

seq_mean= function(seq){
  sum=0
  for (num in seq){
    sum=sum+num
  }
  return(sum/length(seq))
}

seq_mean(c(10,20,30,40))

# Find median of sequence
seq_median = function(seq){
  seq=sort(seq)
  n = length(seq)
  med=seq[1]
  if (n%%2==0){
    med=(seq[n/2]+seq[(n/2)+1])/2
  }
  else{
    med=seq[(n+1)/2]
  }
  return(med)
}

seq_median(c(1,6,4,5,3,2))

# Find Standard Deviation
seq_std=function(seq){
  n=length(seq)
  men=seq_mean(seq)
  ss=0
  for (num in seq){
    ss=ss+(num)^2
  }
  return(sqrt((ss/n) - (men^2)))
}
a=c(1,4,2,5,3,6)
seq_std(a)

# Find mode
seq_mode=function(seq){
  high_count=0
  Mode=0
  for (num in unique(seq)){
    Count = 0
    for (j in seq){
      if (num==j){
        Count=Count+1
      }
    }
    if (Count > high_count){
      high_count=Count
      Mode=num
    }
  }
  return(Mode)
}
a=c(3,13,3,17,41,21,21,30,13,13,13,3)
seq_mode(a)

# Find Median for Grouped Data
grp_med = function(l,u,f){
  cf=rep(0,length(l))
  cf[1]=f[1]
  n=sum(f)
  mi=1
  for (i in 2:length(l)){
    cf[i]=cf[i-1]+f[i]
    #print(cf[i])
    if (cf[i]>floor(n/2)){
      mi=i
      break
    }
  }
  med= l[mi] + ((floor(n/2) - cf[mi-1])/f[mi]) * (u[mi]-l[mi])
  return(med)
}

grp_med(
  c(100,200,300,400,500,600,700,800),
  c(200,300,400,500,600,700,800,900),
  c(45,88,146,206,79,52,30,14)
)

