/** OMG服务*/
include "omg_types.thrift"

namespace java cn.domob.omg.thrift
namespace php Thrift_OMG
namespace py domob_thrift.omg


service OmgService{
  omg_types.Test test(
    /** 测试 */
    1: i64 ad_id
  )

  /** 根据用户输入生成诗词*/
  string generatePoem(
	/** 生成诗词标题*/
	1: string title,
	/** 生成诗词关键字*/
	2: list<string> important_words,
  )

  /** 对输入描述进行分词*/
  list<string> splitWordsForPoem(
	/** 输入的描述语句*/
	1: string sentence,
  )
}
