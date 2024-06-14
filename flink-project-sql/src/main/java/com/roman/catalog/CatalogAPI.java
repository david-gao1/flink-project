package com.roman.catalog;

import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.table.api.EnvironmentSettings;
import org.apache.flink.table.api.bridge.java.StreamTableEnvironment;

/**
 * Desc: Catalog API
 *  on 2020-01-26 21:45

 */
public class CatalogAPI {
    public static void main(String[] args) {
        StreamExecutionEnvironment blinkStreamEnv = StreamExecutionEnvironment.getExecutionEnvironment();
        blinkStreamEnv.setParallelism(1);
        EnvironmentSettings blinkStreamSettings = EnvironmentSettings.newInstance()
                .useBlinkPlanner()
                .inStreamingMode()
                .build();
        StreamTableEnvironment blinkStreamTableEnv = StreamTableEnvironment.create(blinkStreamEnv, blinkStreamSettings);

        //Changing the Current Catalog And Database
        blinkStreamTableEnv.useCatalog("roman");
        blinkStreamTableEnv.useDatabase("roman");

        blinkStreamTableEnv.scan("not_the_current_catalog", "not_the_current_db", "roman");

        //List Available Catalogs/Databases/Tables
        blinkStreamTableEnv.listCatalogs();
        blinkStreamTableEnv.listDatabases();
        blinkStreamTableEnv.listTables();

    }
}
