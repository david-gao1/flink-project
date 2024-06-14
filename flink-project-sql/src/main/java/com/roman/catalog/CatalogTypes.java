package com.roman.catalog;

import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.table.api.EnvironmentSettings;
import org.apache.flink.table.api.bridge.java.StreamTableEnvironment;
import org.apache.flink.table.catalog.GenericInMemoryCatalog;

/**
 * Desc: Catalog Types
 *  on 2020-01-26 21:30

 */
public class CatalogTypes {
    public static void main(String[] args) {
        StreamExecutionEnvironment blinkStreamEnv = StreamExecutionEnvironment.getExecutionEnvironment();
        blinkStreamEnv.setParallelism(1);
        EnvironmentSettings blinkStreamSettings = EnvironmentSettings.newInstance()
                .useBlinkPlanner()
                .inStreamingMode()
                .build();
        StreamTableEnvironment blinkStreamTableEnv = StreamTableEnvironment.create(blinkStreamEnv, blinkStreamSettings);

        blinkStreamTableEnv.registerCatalog("roman", new GenericInMemoryCatalog("roman"));
        //GenericInMemoryCatalog，默认的 catalog


        //HiveCatalog，这个需要添加 Hive connector 和 Hive 的依赖
//        blinkStreamTableEnv.registerCatalog("roman", new HiveCatalog("roman", "roman", "~/roman/hive/conf", "2.3.4"));


    }
}
