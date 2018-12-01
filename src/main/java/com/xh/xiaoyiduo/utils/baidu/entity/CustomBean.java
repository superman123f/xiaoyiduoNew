package com.xh.xiaoyiduo.utils.baidu.entity;

import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 定制Bean
 */
@Component
public class CustomBean {
    private Long log_id;
    private List<Results> results;

    public Long getLog_id() {
        return log_id;
    }

    public void setLog_id(Long log_id) {
        this.log_id = log_id;
    }

    public List<Results> getResults() {
        return results;
    }

    public void setResults(List<Results> results) {
        this.results = results;
    }
}
