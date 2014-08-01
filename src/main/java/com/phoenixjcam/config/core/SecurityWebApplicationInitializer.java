package com.phoenixjcam.config.core;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;
 
/**
 * AbstractSecurityWebApplicationInitializer provides: <br>
 * Registers the DelegatingFilterProxy to use the springSecurityFilterChain <br>
 * it will also register a ContextLoaderListener
 *  
 * @author Bart88
 *
 */
public class SecurityWebApplicationInitializer extends AbstractSecurityWebApplicationInitializer
{
	// all mainly work is done by AbstractSecurityWebApplicationInitializer
}