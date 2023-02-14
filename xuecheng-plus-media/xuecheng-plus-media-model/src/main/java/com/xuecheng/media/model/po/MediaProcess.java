package com.xuecheng.media.model.po;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 
 * </p>
 *
 * @author itcast
 */
@Data
@TableName("media_process")
public class MediaProcess implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 文件标识
     */
    private String fileId;

    /**
     * 文件名称
     */
    private String filename;

    /**
     * 存储源
     */
    private String bucket;

    private String filePath;

    /**
     * 状态,1:未处理，视频处理完成更新为2
     */
    private String status;

    /**
     * 上传时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createDate;

    /**
     * 完成时间
     */
    private LocalDateTime finishDate;

    /**
     * 媒资文件访问地址
     */
    private String url;

    /**
     * 失败原因
     */
    private String errormsg;


}
