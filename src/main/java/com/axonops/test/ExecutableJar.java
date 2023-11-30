package com.axonops.test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/**
 * Main class for Maven Executable Jar.
 */
public class ExecutableJar {

    private static final Logger logger = LoggerFactory.getLogger(ExecutableJar.class);

    public static void main(String[] args) {
        logger.info("Example log from {}", ExecutableJar.class.getSimpleName());
    }
}
