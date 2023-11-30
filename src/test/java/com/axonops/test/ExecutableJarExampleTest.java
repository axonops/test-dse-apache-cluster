package com.axonops.test;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;

/**
 * Unit-level testing for {@link ExecutableJar} object.
 */
public class ExecutableJarExampleTest {

    @Test
    public void shouldCreateJavaRepositoryTemplateMain() {
        ExecutableJar main = new ExecutableJar();
        assertNotNull(main);
    }

}
