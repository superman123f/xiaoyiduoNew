package com.xh.xiaoyiduo.utils.baidu.entity;

import org.springframework.stereotype.Component;

import java.math.BigDecimal;

/**
 * 结果bean
 */
@Component
public class Results {
    private String name;
    //如果出现解析错误，可以考虑换成Object类型哦
    private BigDecimal score;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getScore() {
        return score;
    }

    public void setScore(BigDecimal score) {
        this.score = score;
    }
}
