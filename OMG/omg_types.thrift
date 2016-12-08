/** OMG数据结构*/


namespace java cn.domob.omg.thrift
namespace php Thrift_OMG
namespace py domob_thrift.omg_types


/** 图片数据类型 */
enum ImageDataType {
  IDT_URL = 1,
  IDT_PATH = 2,
  IDT_BINARY = 3,
}


struct Test{
  /** test id */
  1: i64 id,
  /** test name */
  2: string name,

}

struct ImageTag {
  /** 图片tag */
  1: string tag,
  /** 置信度/自信度 0-100 */
  2: i16 confidence,
}

struct ImageAnalyzeResult {
  /** 图片tags */
  1: list<ImageTag> tags,
  /** 图片描述 */
  2: list<string> descriptions,
}

struct ImageData {
  /** 图片url */
  1: string image_url,
  /** 图片文件地址，须确保是一个server可访问的目录（如同一台机器上）*/
  2: string filename,
  /** 图片2进制data */
  3: binary image_binary_data,
}
