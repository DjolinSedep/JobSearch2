package com.attractor.job_search.service;

import com.attractor.job_search.error.ErrorResponseBody;
import org.springframework.validation.BindingResult;

public interface ErrorService {
    ErrorResponseBody makeResponse(Exception exception);

    ErrorResponseBody makeResponse(BindingResult bindingResult);
}
