package com.xuecheng.media.model.dto;

import lombok.Data;
import lombok.ToString;

/**
 * @description 上传普通文件请求参数
 */
 @Data
 @ToString
public class UploadFileParamsDto {

 /**
  * 文件名称
  */
 private String filename;

 /**
  * 文件content-type
 */
 private String contentType;

 /**
  * 文件类型（文档，图片，视频）
  */
 private String fileType;
 /**
  * 文件大小
  */
 private Long fileSize;

 /**
  * 标签
  */
 private String tags;

 /**
  * 上传人
  */
 private String username;

 /**
  * 备注
  */
 private String remark;
}
