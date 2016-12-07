/** OMG服务*/
include "omg_types.thrift"
include "omg_common.thrift"

namespace java cn.domob.omg.thrift
namespace php Thrift_OMG
namespace py domob_thrift.omg


service OmgService{
  omg_types.Test test(
    /** 测试 */
    1: i64 id
  )

  /** 根据用户输入生成诗词*/
  string generatePoem(
	/** 生成诗词标题*/
	1: string title,
	/** 图片标签*/
	2: list<string> tags,
	/** 图片描述*/
	3: list<string> description
  ) throws (1: omg_common.OmgException e)


  /** 根据用户输入检索文案*/
  list<string> searchCreativeTexts(
	/** 图片标签*/
	1: list<string> tags,
	/** 图片描述*/
	2: list<string> description
  ) throws (1: omg_common.OmgException e)
}
