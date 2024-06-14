> 本项目主要记录学习flink的过程以及在工作中遇到的flink问题
> 相关问题解决方案已上传到csdn上，见下连接：

本项目主要探索如下flink主题内容

一. flink概述：

二. flink部署模式与集群搭建

三. flink的编程模型、相关原理

四. flink dataStream

五. flink sql和table api的操作

六. flink的状态管理

七. flink监控与性能优化

1. 如何监控指标，在不同的运行模式监控指标。
2. 反压

八. 其他经验

1. 源码改造
2. 排错经验
3. 面试问答 ing


# 一. flink概述：

> 我们首先从flink的特点、使用场景、作用、架构、运行模型等方面先有一个整体的认识。即它是什么、能做哪些事，怎么做的。


[【概述｜基础】flink系列01：flink概述：flink能做些什么、flink的特点有那些、适合哪些场景、flink的技术的基石是来自哪篇论文](https://blog.csdn.net/hiliang521/article/details/125709428)

[【原理｜架构】Flink系列02：Flink整体架构-成员之间的协调](https://blog.csdn.net/hiliang521/article/details/125718733)

[【运维/安装】Flink + MinIO：实现light-weighting思路下的集群(集群、高可用&&POC、快速搭建)](https://blog.csdn.net/hiliang521/article/details/126860098)


&nbsp;

# 二. flink部署模式与集群搭建
>集群模式有哪些、集群搭建的细节、flink高可用原理等

[【部署模式】Flink系列03-部署模式+集群资源提供者](https://blog.csdn.net/hiliang521/article/details/125747941)

&nbsp;

# 三. flink的编程模型、相关原理
> flink的编程模型：编程接口、程序结构、数据类型：类型支持与typeinformation获取。

[【内存模型】Flink内存模型：从宏观（Flink内存模型）、微观（Flink内存结构）、数据传输等角度分析Flink的内存管理](https://blog.csdn.net/hiliang521/article/details/125564003)

[【原理｜数据传输】Flink系列之数据传输原理](https://blog.csdn.net/hiliang521/article/details/125496774)
ing

&nbsp;
# 四. flink dataStream
> - 编程模型、时间概念与水印、窗口计算、作业链和资源组、异步操作。
> - api中主要有输入源、转换算子、数据输出等api的操作。


[【架构｜概念｜性能调优】slot相关概念：Flink的job的并行度是怎么计算的。算子链与slot共享是如何优化flink资源与计算的](https://blog.csdn.net/hiliang521/article/details/125379374)


&nbsp;

# 五. flink sql和table api的操作
> - sql与table api
> - 常见场景下的sql使用等
> - 自定义函数
> - connector

[【flink SQL基础｜概念】flink sql之时态表：join时要使用proctime作为时态表的time](https://blog.csdn.net/hiliang521/article/details/125607031)

[【双流（1）｜原理】flink 双流join原理（1）Interval Join：state过大？ 回撤现象出现时，sink如何处理，还有如何优化回撤？数据出现shuffle时join是如何处理的？](https://blog.csdn.net/hiliang521/article/details/127282495)

ing
&nbsp;

# 六. flink的状态管理
> 对于一些任务，比如join、聚合或者是去重等操作需要flink保存状态来实现相关语义。对于flink的状态管理有如下几个方面：
> 有状态计算的原理是什么
> checkpoint和savepoint
> 状态管理区
> queryable state

[【状态管理｜概述】Flink的状态管理：为什么需要state、怎么保存state、对于state过大怎么处理](https://blog.csdn.net/hiliang521/article/details/127314339)

ing
&nbsp;

# 七. flink监控与性能优化
> 监控指标
> 反压的监控与优化
> checkpoint的监控与优化
> Flink内存优化：flink内存配置、Network Buffers的配置

[【监控｜性能调优】Flink 性能调优1之 反压](https://blog.csdn.net/hiliang521/article/details/125347925)

[【内存模型】Flink内存模型：从宏观（Flink内存模型）、微观（Flink内存结构）、数据传输等角度分析Flink的内存管理](https://blog.csdn.net/hiliang521/article/details/125564003)

[【性能调优1】（***重点***）Flink常见内存问题及调优指南（一）](https://blog.csdn.net/hiliang521/article/details/125867100)

[【性能｜调优】Flink on yarn双流join问题分析+性能调优思路](https://blog.csdn.net/hiliang521/article/details/125996243)

&nbsp;
# 八. 其他经验
## 1. 源码改造
[【源码｜编译】flink 12 源码编译及使用idea运行、debug](https://blog.csdn.net/hiliang521/article/details/126180969)

[【源码改造｜性能】Flink jdbc connector 源码改造sink之 clickhouse多节点轮询写与性能分析](https://blog.csdn.net/hiliang521/article/details/126097420)

[【源码改造】Flink-jdbc-connector源码简析+改造支持谓词下推](https://blog.csdn.net/hiliang521/article/details/125643471)

[【源码改造】flink JDBC connector 源码改造之 类型转换 java.time.LocalDateTime cannot be cast to java.sql.Timestamp](https://blog.csdn.net/hiliang521/article/details/125247244)

&nbsp;
&nbsp;
## 2. 排错经验
[【排错】记一次（flink on yarn） 提交任务的排错之旅（yarn队列、namenode、resourcemanager、flink job全崩盘）](https://blog.csdn.net/hiliang521/article/details/126501725)

[【性能｜调优】Flink on yarn双流join问题分析+性能调优思路](https://blog.csdn.net/hiliang521/article/details/125996243)

[【job排错】记一次flink on hadoop with per-job 报错排查](https://blog.csdn.net/hiliang521/article/details/125606973)
&nbsp;

&nbsp;
## 3. 面试问答 ing
怎么做压力测试和监控？

> 产生的数据流的速度如果过快，而下游的算子消费不过来的话，会产生背压。背压的监控可以使用Flink Web UI来可视化监控Metrics。
> &nbsp;
> 反压的场景：
> - 因为watermark设置过大导致某一时刻数据量激增导致下游数据出现反压：可以将设置watermark设置的小一点，然后把迟到的元素发送到测输出流中，晚一点更新结果。
>-  sink消费慢出现反压：横向拓展，增加并行度，让不同slot执行，分散那一点的压力。

&nbsp;

flink的相关优化
> - 集群角色的内存配置方面
> - 合理利用资源：slot和并行度、slot共享
> - 数据倾斜：null过多，加盐打散。
> - 广播变量：小数据集与大数据进行join：将小数据集广播，避免代价高的冲分区。
> - 源码改造：谓词下推、轮询写入

&nbsp;

海量key怎么去重？
> 因为可能有上亿个key，内存放不下，可以考虑使用布隆过滤器（Bloom Filter）来去重。

&nbsp;
Flink中的exactly-once语义如何实现的，状态如何存储的？
> Flink依靠checkpoint机制来实现exactly-once语义，如果要实现端到端的exactly-once，还需要外部source和sink满足一定的条件。



&nbsp;
Flink程序在面对数据高峰期时如何处理？
> 使用大容量的Kafka把数据先放到消息队列里面作为数据源，再使用Flink进行消费，不过这样会影响一点实时性。



&nbsp;
Flink的checkpoint机制对比spark有什么不同和优势？
> spark streaming的checkpoint仅仅是针对driver的故障恢复做了数据和元数据的checkpoint。
> flink的checkpoint机制采用的是轻量级的分布式快照，实现了每个算子的快照，及流动中的数据的快照。

&nbsp;
&nbsp;