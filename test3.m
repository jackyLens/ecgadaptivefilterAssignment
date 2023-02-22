[signal,Fs]=rdsamp('106');
[bwline,F1] = rdsamp('ma');
sigal1 = signal(:,1);
bw1 = bwline(:,1);
mixsig = sigal1+bw1;
ecg = mixsig -mean(mixsig);
a=ecg(1+4096*12:8192+4096*12);
[swa,swd]=swt(a,5,'db4');
for i=1:5
    t_s(i)=median(abs(swd(i,:)))/0.6745;
end
for i=1:5
    r(i)=t_s(i)*sqrt(2*log(8192))/log(i+1);
end
for i=1:5
    for j=1:8192
        if abs(swd(i,j))>=r(i)
            swd(i,j)=swd(i,j);
        else
            swd(i,j)=0;
        end
    end
end

X = iswt(swa,swd,'db4');
figure
plot(a)
hold on
plot(X)

