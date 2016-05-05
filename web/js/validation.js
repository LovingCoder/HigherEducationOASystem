/**
 * Created by Tang on 2016/5/5.
 */
/**
 * 校验输入是否为空
 * @param str
 * @returns {boolean}
 */
function validateNullOrEmpty(str) {
    if (null == str || '' == str) {
        return false;
    }
}

/**
 * 校验性别
 * @param sex
 * @returns {boolean}
 */
function validateSex(sex) {
    if (null == sex || '' == sex) {
        return false;
    } else if (0 != sex || 1 != sex) {
        return false;
    }
}


/**
 * 校验邮箱
 * @param email
 * @returns {boolean}
 */
function validateEmail(email) {
    var reg = /\w+[@]{1}\w+[.]\w+/;
    if (null == email || '' == email) {
        return false;
    } else if (reg.test(email)) {
        return true;
    } else
        return false;
}

/**
 * 检查表格中的数据是否为空 为空则添加未填写标签
 * @param data
 * @returns {*}
 */
function checkTdNUllOrEmpty(data) {
    if (null == data || '' == data) {
        return "<span class='label label-danger'>未填写</span>";
    } else {
        return data;
    }
}

/**
 * 根据返回的性别选项 填写男 还是女
 * @param data
 * @returns {*}
 */
function checkSex(data) {
    if (null == data || '' == data) {
        return "<span class='label label-danger'>未填写</span>";
    } else if (0 == data) {
        return '女';
    } else if (1 == data) {
        return '男';
    }
}

/**
 * 根据返回的出生日期 计算年龄
 * @param data
 * @returns {*}
 */
function getAge(data){
    if (null == data || '' == data) {
        return "<span class='label label-danger'>未填写</span>";
    } else {
        var nowdate = new Date();
        var age =nowdate.getFullYear() - data.substr(0,4);
        return age;
    }
}