/** 公共thrift */

namespace java cn.domob.omg.common.thrift
namespace php Thrift_OMG_Common
namespace cpp domob.omg.Common
namespace py domob_thrift.omg_common

enum OmgServiceCode {
  /** 参数不合法错误码 */
  ERROR_PARAM_INVALID              = 401,
  /** 系统错误码 */
  ERROR_SYSTEM_ERROR               = 501,
  /** 访问权限错误码 */
  ERROR_PERMISSION_DENIED          = 601,
}

exception OmgException {
  1: OmgServiceCode code,
  2: string message,
}


/** vim: set filetype=java ts=2 sts=2 sw=2 fdm=indent et : */
