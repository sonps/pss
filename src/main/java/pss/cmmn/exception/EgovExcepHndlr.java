package pss.cmmn.exception;

import org.egovframe.rte.fdl.cmmn.exception.handler.ExceptionHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class EgovExcepHndlr implements ExceptionHandler{

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovExcepHndlr.class);
	
	@Override
	public void occur(Exception exception, String packageName) {
		LOGGER.debug(" EgovServiceExceptionHandler run...............");
	}
}