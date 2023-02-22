# ecgadaptivefilterAssignment
心电信号中主要存在三种干扰：肌电干扰，工频，基线漂移。
使用自适应滤波去除基线漂移
但自适应滤波不适合处理肌电干扰，使用以FIR为基础的自适应滤波器对肌电干扰去噪可能存在一些缺陷。虽然FIR滤波器在设计时可以针对肌电干扰的频率范围进行优化，但是由于肌电干扰的频率与心电信号主要成分的频率存在重叠的部分，因此使用FIR滤波器可能会误删一些心电信号，导致滤波后的信号失真。
另外，自适应滤波器是一种逐步调整滤波器系数的滤波器，它的性能很大程度上取决于其自适应算法的选择和参数设置。如果算法选择不合适或参数设置不当，可能会导致滤波效果不佳，甚至使滤波后的信号质量变差。
因此使用平稳小波变换去除肌电干扰。
由于已经进行了平稳小波变换，因此可以在工频干扰所在的频带更改小波变换的系数以去除工频干扰。不需要额外的数字滤波器用于去除工频干扰。
