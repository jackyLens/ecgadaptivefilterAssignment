[signal,Fs]=rdsamp('106');
[bwline,F1] = rdsamp('bw');
sigal1 = signal(:,1);
bw1 = bwline(:,1);
mixsig = sigal1+bw1;
% plot(sigal1);
% hold on
% plot(mixsig)

ecg = mixsig;
ecg = ecg-mean(ecg);

% ecg=ecg-mean(ecg); %pure ecg short
% q=[ecg ecg ecg];  %pure ecg long

% d=ecg+ma;   %noisy ecg %input signal to the WAVELET DECOMPOSITION BLOCK
[C,L] = wavedec(ecg,7,'db4');

                D1 = wrcoef('d',C,L,'db4',1);
                D2 = wrcoef('d',C,L,'db4',2);
                D3 = wrcoef('d',C,L,'db4',3);
                D4 = wrcoef('d',C,L,'db4',4);
                D5 = wrcoef('d',C,L,'db4',5);
                D6 = wrcoef('d',C,L,'db4',6);
                D7 = wrcoef('d',C,L,'db4',7);
                A7 = wrcoef('a',C,L,'db4',7);

ref=D1+D2+D3+A7;
% d=[d d d];
x=ref;
M=12;
mu=0.01;
nlms = dsp.LMSFilter('Length',M,'Method','Normalized LMS','StepSize',mu);%Designing LMS filter
reference=x;
noisy=ecg;
[y1,e1] = nlms(reference,noisy);% =[y,err]=lms(ref,noisy)
y=y1';
e=e1';

figure(1)
% subplot(311)
% plot(q);
% title('original ecg');
% subplot(312)
% plot(d)
% title('input noisy ecg');
% subplot(313)
% plot(e)
% title('filtered output');

plot(ecg)
hold on
plot(e)

