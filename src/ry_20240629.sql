-- ----------------------------
-- 1、Department
-- ----------------------------
drop table if exists sys_dept;
create table sys_dept (
                          dept_id           bigint(20)      not null auto_increment    comment 'Department ID',
                          parent_id         bigint(20)      default 0                  comment 'Parent Department ID',
                          ancestors         varchar(50)     default ''                 comment 'Root',
                          dept_name         varchar(30)     default ''                 comment 'Department Name',
                          order_num         int(4)          default 0                  comment 'Sort',
                          leader            varchar(20)     default null               comment 'Manager',
                          phone             varchar(11)     default null               comment 'Cell Phone',
                          email             varchar(50)     default null               comment 'Email',
                          status            char(1)         default '0'                comment 'Status（0Normal 1Disable）',
                          del_flag          char(1)         default '0'                comment 'Delete Flag(0Normal 2Deleted)',
                          create_by         varchar(64)     default ''                 comment 'Creator',
                          create_time 	    datetime                                   comment 'Create Time',
                          update_by         varchar(64)     default ''                 comment 'Update by',
                          update_time       datetime                                   comment 'Update Time',
                          primary key (dept_id)
) engine=innodb auto_increment=200 comment = 'Department';

-- ----------------------------
-- 初始化-Department数据
-- ----------------------------
insert into sys_dept values(100,  0,   '0',          'Admin',   0, 'Admin', '1', '1@1.com', '0', '0', 'admin', sysdate(), '', null);


-- ----------------------------
-- 2、Users
-- ----------------------------
drop table if exists sys_user;
create table sys_user (
                          user_id           bigint(20)      not null auto_increment    comment 'User ID',
                          dept_id           bigint(20)      default null               comment 'Department ID',
                          user_name         varchar(30)     not null                   comment 'Account',
                          nick_name         varchar(30)     not null                   comment 'Nickname',
                          user_type         varchar(2)      default '00'               comment 'User Type（00System User）',
                          email             varchar(50)     default ''                 comment 'Email',
                          phonenumber       varchar(11)     default ''                 comment 'Cell Phone',
                          sex               char(1)         default '0'                comment 'Gender(0Male 1Female 2Unknow)',
                          avatar            varchar(100)    default ''                 comment 'Avatar',
                          password          varchar(100)    default ''                 comment 'Password',
                          status            char(1)         default '0'                comment 'Account Status(0Normal 1Disable)',
                          del_flag          char(1)         default '0'                comment 'Delete Flag(0Normal 2Deleted)',
                          login_ip          varchar(128)    default ''                 comment 'Last Login IP',
                          login_date        datetime                                   comment 'Last Login Time',
                          create_by         varchar(64)     default ''                 comment 'Creator',
                          create_time       datetime                                   comment 'Create Time',
                          update_by         varchar(64)     default ''                 comment 'Update by',
                          update_time       datetime                                   comment 'Update Time',
                          remark            varchar(500)    default null               comment 'Remark',
                          primary key (user_id)
) engine=innodb auto_increment=100 comment = 'Users';

-- ----------------------------
-- 初始化-Users数据
-- ----------------------------
insert into sys_user values(1,  103, 'admin', 'Admin', '00', '1@1.com', '1', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', sysdate(), 'admin', sysdate(), '', null, 'Admin');


-- ----------------------------
-- 3、Posts
-- ----------------------------
drop table if exists sys_post;
create table sys_post
(
    post_id       bigint(20)      not null auto_increment    comment 'Post ID',
    post_code     varchar(64)     not null                   comment 'Post No.',
    post_name     varchar(50)     not null                   comment 'Post Name',
    post_sort     int(4)          not null                   comment 'Sort',
    status        char(1)         not null                   comment 'Status(0Normal 1Disable)',
    create_by     varchar(64)     default ''                 comment 'Creator',
    create_time   datetime                                   comment 'Create Time',
    update_by     varchar(64)     default ''			       comment 'Update by',
    update_time   datetime                                   comment 'Update Time',
    remark        varchar(500)    default null               comment 'Remark',
    primary key (post_id)
) engine=innodb comment = 'Posts';

-- ----------------------------
-- 初始化-Posts数据
-- ----------------------------
insert into sys_post values(1, 'admin',  'Admin',    1, '0', 'admin', sysdate(), '', null, '');


-- ----------------------------
-- 4、角色信息
-- ----------------------------
drop table if exists sys_role;
create table sys_role (
                          role_id              bigint(20)      not null auto_increment    comment 'Role ID',
                          role_name            varchar(30)     not null                   comment 'Role Name',
                          role_key             varchar(100)    not null                   comment 'Permission Key',
                          role_sort            int(4)          not null                   comment 'Sort',
                          data_scope           char(1)         default '1'                comment 'Data Permission(1:All 2:Custom 3:Local Department 4:Local Department Cascate Sub)',
                          menu_check_strictly  tinyint(1)      default 1                  comment '菜单树选择项是否关联显示',
                          dept_check_strictly  tinyint(1)      default 1                  comment 'Department树选择项是否关联显示',
                          status               char(1)         not null                   comment 'Role Status(0Normal 1Disable)',
                          del_flag             char(1)         default '0'                comment 'Delete Flag(0Normal 2Deleted)',
                          create_by            varchar(64)     default ''                 comment 'Creator',
                          create_time          datetime                                   comment 'Create Time',
                          update_by            varchar(64)     default ''                 comment 'Update by',
                          update_time          datetime                                   comment 'Update Time',
                          remark               varchar(500)    default null               comment 'Remark',
                          primary key (role_id)
) engine=innodb auto_increment=100 comment = 'Role';

-- ----------------------------
-- 初始化-角色信息数据
-- ----------------------------
insert into sys_role values('1', 'Admin',  'admin',  1, 1, 1, 1, '0', '0', 'admin', sysdate(), '', null, 'Admin');


-- ----------------------------
-- 5、菜单权限
-- ----------------------------
drop table if exists sys_menu;
create table sys_menu (
                          menu_id           bigint(20)      not null auto_increment    comment 'Menu ID',
                          menu_name         varchar(50)     not null                   comment 'Menu Name',
                          parent_id         bigint(20)      default 0                  comment 'Parent Menu ID',
                          order_num         int(4)          default 0                  comment 'Sort',
                          path              varchar(200)    default ''                 comment 'Router Path',
                          component         varchar(255)    default null               comment 'Component Path',
                          query             varchar(255)    default null               comment 'Route Params',
                          route_name        varchar(50)     default ''                 comment 'Route Name',
                          is_frame          int(1)          default 1                  comment 'Is OutLink(0Yes 1No)',
                          is_cache          int(1)          default 0                  comment 'Is Cached(0Yes 1No)',
                          menu_type         char(1)         default ''                 comment 'Menu Type(M:Dir C:Menu F:Button)',
                          visible           char(1)         default 0                  comment 'Menu Visible Status(0:Show 1:Hide)',
                          status            char(1)         default 0                  comment 'Menu Status(0Normal 1Disable)',
                          perms             varchar(100)    default null               comment 'Permision Key',
                          icon              varchar(100)    default '#'                comment 'Icon',
                          create_by         varchar(64)     default ''                 comment 'Creator',
                          create_time       datetime                                   comment 'Create Time',
                          update_by         varchar(64)     default ''                 comment 'Update by',
                          update_time       datetime                                   comment 'Update Time',
                          remark            varchar(500)    default ''                 comment 'Remark',
                          primary key (menu_id)
) engine=innodb auto_increment=2000 comment = 'Menu';

-- ----------------------------
-- 初始化-菜单信息数据
-- ----------------------------
-- 一级菜单
insert into sys_menu values('1', 'System', '0', '1', 'system',           null, '', '', 1, 0, 'M', '0', '0', '', 'system',   'admin', sysdate(), '', null, 'System目录');
insert into sys_menu values('2', 'Monitor', '0', '2', 'monitor',          null, '', '', 1, 0, 'M', '0', '0', '', 'monitor',  'admin', sysdate(), '', null, 'Monitor目录');
insert into sys_menu values('3', 'Tool', '0', '3', 'tool',             null, '', '', 1, 0, 'M', '0', '0', '', 'tool',     'admin', sysdate(), '', null, 'Tool目录');
insert into sys_menu values('4', 'Dashboard', '0', '4', 'http://', null, '', '', 0, 0, 'M', '0', '0', '', 'guide',    'admin', sysdate(), '', null, 'Dashboard地址');
-- 二级菜单
insert into sys_menu values('100',  'User Management', '1',   '1', 'user',       'system/user/index',        '', '', 1, 0, 'C', '0', '0', 'system:user:list',        'user',          'admin', sysdate(), '', null, 'User Management菜单');
insert into sys_menu values('101',  'Role Management', '1',   '2', 'role',       'system/role/index',        '', '', 1, 0, 'C', '0', '0', 'system:role:list',        'peoples',       'admin', sysdate(), '', null, 'Role Management菜单');
insert into sys_menu values('102',  'Menu Management', '1',   '3', 'menu',       'system/menu/index',        '', '', 1, 0, 'C', '0', '0', 'system:menu:list',        'tree-table',    'admin', sysdate(), '', null, 'Menu Management菜单');
insert into sys_menu values('103',  'Department Management', '1',   '4', 'dept',       'system/dept/index',        '', '', 1, 0, 'C', '0', '0', 'system:dept:list',        'tree',          'admin', sysdate(), '', null, 'Department Management菜单');
insert into sys_menu values('104',  'Post Management', '1',   '5', 'post',       'system/post/index',        '', '', 1, 0, 'C', '0', '0', 'system:post:list',        'post',          'admin', sysdate(), '', null, 'Post Management菜单');
insert into sys_menu values('105',  'Dictionary Management', '1',   '6', 'dict',       'system/dict/index',        '', '', 1, 0, 'C', '0', '0', 'system:dict:list',        'dict',          'admin', sysdate(), '', null, 'Dictionary Management菜单');
insert into sys_menu values('106',  'Config', '1',   '7', 'config',     'system/config/index',      '', '', 1, 0, 'C', '0', '0', 'system:config:list',      'edit',          'admin', sysdate(), '', null, 'Config菜单');
insert into sys_menu values('107',  'Notice', '1',   '8', 'notice',     'system/notice/index',      '', '', 1, 0, 'C', '0', '0', 'system:notice:list',      'message',       'admin', sysdate(), '', null, 'Notice菜单');
insert into sys_menu values('108',  'Logs', '1',   '9', 'log',        '',                         '', '', 1, 0, 'M', '0', '0', '',                        'log',           'admin', sysdate(), '', null, 'Logs菜单');
insert into sys_menu values('109',  'Online User', '2',   '1', 'online',     'monitor/online/index',     '', '', 1, 0, 'C', '0', '0', 'monitor:online:list',     'online',        'admin', sysdate(), '', null, 'Online User菜单');
insert into sys_menu values('110',  'Jobs', '2',   '2', 'job',        'monitor/job/index',        '', '', 1, 0, 'C', '0', '0', 'monitor:job:list',        'job',           'admin', sysdate(), '', null, 'Jobs菜单');
insert into sys_menu values('111',  '数据监控', '2',   '3', 'druid',      'monitor/druid/index',      '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list',      'druid',         'admin', sysdate(), '', null, '数据监控菜单');
insert into sys_menu values('112',  '服务监控', '2',   '4', 'server',     'monitor/server/index',     '', '', 1, 0, 'C', '0', '0', 'monitor:server:list',     'server',        'admin', sysdate(), '', null, '服务监控菜单');
insert into sys_menu values('113',  '缓存监控', '2',   '5', 'cache',      'monitor/cache/index',      '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list',      'redis',         'admin', sysdate(), '', null, '缓存监控菜单');
insert into sys_menu values('114',  '缓存列', '2',   '6', 'cacheList',  'monitor/cache/list',       '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list',      'redis-list',    'admin', sysdate(), '', null, '缓存列菜单');
insert into sys_menu values('115',  '单构建', '3',   '1', 'build',      'tool/build/index',         '', '', 1, 0, 'C', '0', '0', 'tool:build:list',         'build',         'admin', sysdate(), '', null, '单构建菜单');
insert into sys_menu values('116',  '代码生成', '3',   '2', 'gen',        'tool/gen/index',           '', '', 1, 0, 'C', '0', '0', 'tool:gen:list',           'code',          'admin', sysdate(), '', null, '代码生成菜单');
insert into sys_menu values('117',  '系统接口', '3',   '3', 'swagger',    'tool/swagger/index',       '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list',       'swagger',       'admin', sysdate(), '', null, '系统接口菜单');
-- 三级菜单
insert into sys_menu values('500',  '操作日志', '108', '1', 'operlog',    'monitor/operlog/index',    '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list',    'form',          'admin', sysdate(), '', null, '操作日志菜单');
insert into sys_menu values('501',  '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor',    'admin', sysdate(), '', null, '登录日志菜单');
-- User Management按钮
insert into sys_menu values('1000', '用户查询', '100', '1',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query',          '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1001', '用户新增', '100', '2',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add',            '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1002', '用户修改', '100', '3',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit',           '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1003', '用户删除', '100', '4',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1004', '用户导出', '100', '5',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1005', '用户导入', '100', '6',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1006', '重置Password', '100', '7',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd',       '#', 'admin', sysdate(), '', null, '');
-- Role Management按钮
insert into sys_menu values('1007', '角色查询', '101', '1',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query',          '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1008', '角色新增', '101', '2',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add',            '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1009', '角色修改', '101', '3',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit',           '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1010', '角色删除', '101', '4',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1011', '角色导出', '101', '5',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export',         '#', 'admin', sysdate(), '', null, '');
-- Menu Management按钮
insert into sys_menu values('1012', '菜单查询', '102', '1',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query',          '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1013', '菜单新增', '102', '2',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add',            '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1014', '菜单修改', '102', '3',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit',           '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1015', '菜单删除', '102', '4',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove',         '#', 'admin', sysdate(), '', null, '');
-- Department Management按钮
insert into sys_menu values('1016', 'Department查询', '103', '1',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query',          '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1017', 'Department新增', '103', '2',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add',            '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1018', 'Department修改', '103', '3',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit',           '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1019', 'Department删除', '103', '4',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove',         '#', 'admin', sysdate(), '', null, '');
-- Post Management按钮
insert into sys_menu values('1020', '岗位查询', '104', '1',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query',          '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1021', '岗位新增', '104', '2',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add',            '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1022', '岗位修改', '104', '3',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit',           '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1023', '岗位删除', '104', '4',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1024', '岗位导出', '104', '5',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export',         '#', 'admin', sysdate(), '', null, '');
-- Dictionary Management按钮
insert into sys_menu values('1025', '字典查询', '105', '1', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query',          '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1026', '字典新增', '105', '2', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add',            '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1027', '字典修改', '105', '3', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit',           '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1028', '字典删除', '105', '4', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1029', '字典导出', '105', '5', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export',         '#', 'admin', sysdate(), '', null, '');
-- Config按钮
insert into sys_menu values('1030', '参数查询', '106', '1', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1031', '参数新增', '106', '2', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add',          '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1032', '参数修改', '106', '3', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1033', '参数删除', '106', '4', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove',       '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1034', '参数导出', '106', '5', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export',       '#', 'admin', sysdate(), '', null, '');
-- Notice按钮
insert into sys_menu values('1035', '公告查询', '107', '1', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1036', '公告新增', '107', '2', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add',          '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1037', '公告修改', '107', '3', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1038', '公告删除', '107', '4', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove',       '#', 'admin', sysdate(), '', null, '');
-- 操作日志按钮
insert into sys_menu values('1039', '操作查询', '500', '1', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1040', '操作删除', '500', '2', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove',     '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1041', '日志导出', '500', '3', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export',     '#', 'admin', sysdate(), '', null, '');
-- 登录日志按钮
insert into sys_menu values('1042', '登录查询', '501', '1', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query',   '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1043', '登录删除', '501', '2', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove',  '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1044', '日志导出', '501', '3', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export',  '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1045', '账户解锁', '501', '4', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock',  '#', 'admin', sysdate(), '', null, '');
-- Online User按钮
insert into sys_menu values('1046', '在线查询', '109', '1', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query',       '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1047', '批量强退', '109', '2', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1048', '单条强退', '109', '3', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', sysdate(), '', null, '');
-- Jobs按钮
insert into sys_menu values('1049', '任务查询', '110', '1', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query',          '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1050', '任务新增', '110', '2', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add',            '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1051', '任务修改', '110', '3', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit',           '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1052', '任务删除', '110', '4', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1053', '状态修改', '110', '5', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus',   '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1054', '任务导出', '110', '6', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export',         '#', 'admin', sysdate(), '', null, '');
-- 代码生成按钮
insert into sys_menu values('1055', '生成查询', '116', '1', '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query',             '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1056', '生成修改', '116', '2', '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit',              '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1057', '生成删除', '116', '3', '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove',            '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1058', '导入代码', '116', '4', '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import',            '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1059', '预览代码', '116', '5', '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview',           '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1060', '生成代码', '116', '6', '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code',              '#', 'admin', sysdate(), '', null, '');


-- ----------------------------
-- 6、用户和角色关联  用户N-1角色
-- ----------------------------
drop table if exists sys_user_role;
create table sys_user_role (
                               user_id   bigint(20) not null comment 'User ID',
                               role_id   bigint(20) not null comment 'Role ID',
                               primary key(user_id, role_id)
) engine=innodb comment = '用户和角色关联';

-- ----------------------------
-- 初始化-用户和角色关联数据
-- ----------------------------
insert into sys_user_role values ('1', '1');
insert into sys_user_role values ('2', '2');


-- ----------------------------
-- 7、角色和菜单关联  角色1-N菜单
-- ----------------------------
drop table if exists sys_role_menu;
create table sys_role_menu (
                               role_id   bigint(20) not null comment 'Role ID',
                               menu_id   bigint(20) not null comment 'Menu ID',
                               primary key(role_id, menu_id)
) engine=innodb comment = '角色和菜单关联';

-- ----------------------------
-- 初始化-角色和菜单关联数据
-- ----------------------------
insert into sys_role_menu values ('2', '1');
insert into sys_role_menu values ('2', '2');
insert into sys_role_menu values ('2', '3');
insert into sys_role_menu values ('2', '4');
insert into sys_role_menu values ('2', '100');
insert into sys_role_menu values ('2', '101');
insert into sys_role_menu values ('2', '102');
insert into sys_role_menu values ('2', '103');
insert into sys_role_menu values ('2', '104');
insert into sys_role_menu values ('2', '105');
insert into sys_role_menu values ('2', '106');
insert into sys_role_menu values ('2', '107');
insert into sys_role_menu values ('2', '108');
insert into sys_role_menu values ('2', '109');
insert into sys_role_menu values ('2', '110');
insert into sys_role_menu values ('2', '111');
insert into sys_role_menu values ('2', '112');
insert into sys_role_menu values ('2', '113');
insert into sys_role_menu values ('2', '114');
insert into sys_role_menu values ('2', '115');
insert into sys_role_menu values ('2', '116');
insert into sys_role_menu values ('2', '117');
insert into sys_role_menu values ('2', '500');
insert into sys_role_menu values ('2', '501');
insert into sys_role_menu values ('2', '1000');
insert into sys_role_menu values ('2', '1001');
insert into sys_role_menu values ('2', '1002');
insert into sys_role_menu values ('2', '1003');
insert into sys_role_menu values ('2', '1004');
insert into sys_role_menu values ('2', '1005');
insert into sys_role_menu values ('2', '1006');
insert into sys_role_menu values ('2', '1007');
insert into sys_role_menu values ('2', '1008');
insert into sys_role_menu values ('2', '1009');
insert into sys_role_menu values ('2', '1010');
insert into sys_role_menu values ('2', '1011');
insert into sys_role_menu values ('2', '1012');
insert into sys_role_menu values ('2', '1013');
insert into sys_role_menu values ('2', '1014');
insert into sys_role_menu values ('2', '1015');
insert into sys_role_menu values ('2', '1016');
insert into sys_role_menu values ('2', '1017');
insert into sys_role_menu values ('2', '1018');
insert into sys_role_menu values ('2', '1019');
insert into sys_role_menu values ('2', '1020');
insert into sys_role_menu values ('2', '1021');
insert into sys_role_menu values ('2', '1022');
insert into sys_role_menu values ('2', '1023');
insert into sys_role_menu values ('2', '1024');
insert into sys_role_menu values ('2', '1025');
insert into sys_role_menu values ('2', '1026');
insert into sys_role_menu values ('2', '1027');
insert into sys_role_menu values ('2', '1028');
insert into sys_role_menu values ('2', '1029');
insert into sys_role_menu values ('2', '1030');
insert into sys_role_menu values ('2', '1031');
insert into sys_role_menu values ('2', '1032');
insert into sys_role_menu values ('2', '1033');
insert into sys_role_menu values ('2', '1034');
insert into sys_role_menu values ('2', '1035');
insert into sys_role_menu values ('2', '1036');
insert into sys_role_menu values ('2', '1037');
insert into sys_role_menu values ('2', '1038');
insert into sys_role_menu values ('2', '1039');
insert into sys_role_menu values ('2', '1040');
insert into sys_role_menu values ('2', '1041');
insert into sys_role_menu values ('2', '1042');
insert into sys_role_menu values ('2', '1043');
insert into sys_role_menu values ('2', '1044');
insert into sys_role_menu values ('2', '1045');
insert into sys_role_menu values ('2', '1046');
insert into sys_role_menu values ('2', '1047');
insert into sys_role_menu values ('2', '1048');
insert into sys_role_menu values ('2', '1049');
insert into sys_role_menu values ('2', '1050');
insert into sys_role_menu values ('2', '1051');
insert into sys_role_menu values ('2', '1052');
insert into sys_role_menu values ('2', '1053');
insert into sys_role_menu values ('2', '1054');
insert into sys_role_menu values ('2', '1055');
insert into sys_role_menu values ('2', '1056');
insert into sys_role_menu values ('2', '1057');
insert into sys_role_menu values ('2', '1058');
insert into sys_role_menu values ('2', '1059');
insert into sys_role_menu values ('2', '1060');

-- ----------------------------
-- 8、角色和Department关联  角色1-NDepartment
-- ----------------------------
drop table if exists sys_role_dept;
create table sys_role_dept (
                               role_id   bigint(20) not null comment 'Role ID',
                               dept_id   bigint(20) not null comment 'Department ID',
                               primary key(role_id, dept_id)
) engine=innodb comment = '角色和Department关联';

-- ----------------------------
-- 初始化-角色和Department关联数据
-- ----------------------------
insert into sys_role_dept values ('2', '100');
insert into sys_role_dept values ('2', '101');
insert into sys_role_dept values ('2', '105');


-- ----------------------------
-- 9、用户与岗位关联  用户1-N岗位
-- ----------------------------
drop table if exists sys_user_post;
create table sys_user_post
(
    user_id   bigint(20) not null comment 'User ID',
    post_id   bigint(20) not null comment 'Post ID',
    primary key (user_id, post_id)
) engine=innodb comment = '用户与岗位关联';

-- ----------------------------
-- 初始化-用户与岗位关联数据
-- ----------------------------
insert into sys_user_post values ('1', '1');
insert into sys_user_post values ('2', '2');


-- ----------------------------
-- 10、操作日志记录
-- ----------------------------
drop table if exists sys_oper_log;
create table sys_oper_log (
                              oper_id           bigint(20)      not null auto_increment    comment '日志主键',
                              title             varchar(50)     default ''                 comment '模块标题',
                              business_type     int(2)          default 0                  comment '业务类型（0其它 1新增 2修改 3删除）',
                              method            varchar(200)    default ''                 comment '方法名称',
                              request_method    varchar(10)     default ''                 comment '请求方式',
                              operator_type     int(1)          default 0                  comment '操作类别（0其它 1后台用户 2手机端用户）',
                              oper_name         varchar(50)     default ''                 comment '操作人员',
                              dept_name         varchar(50)     default ''                 comment 'Department Name',
                              oper_url          varchar(255)    default ''                 comment '请求URL',
                              oper_ip           varchar(128)    default ''                 comment '主机地址',
                              oper_location     varchar(255)    default ''                 comment '操作地点',
                              oper_param        varchar(2000)   default ''                 comment '请求参数',
                              json_result       varchar(2000)   default ''                 comment '返回参数',
                              status            int(1)          default 0                  comment '操作状态（0正常 1异常）',
                              error_msg         varchar(2000)   default ''                 comment '错误消息',
                              oper_time         datetime                                   comment '操作时间',
                              cost_time         bigint(20)      default 0                  comment '消耗时间',
                              primary key (oper_id),
                              key idx_sys_oper_log_bt (business_type),
                              key idx_sys_oper_log_s  (status),
                              key idx_sys_oper_log_ot (oper_time)
) engine=innodb auto_increment=100 comment = '操作日志记录';


-- ----------------------------
-- 11、字典类型
-- ----------------------------
drop table if exists sys_dict_type;
create table sys_dict_type
(
    dict_id          bigint(20)      not null auto_increment    comment '字典主键',
    dict_name        varchar(100)    default ''                 comment '字典名称',
    dict_type        varchar(100)    default ''                 comment '字典类型',
    status           char(1)         default '0'                comment 'Status(0Normal 1Disable)',
    create_by        varchar(64)     default ''                 comment 'Creator',
    create_time      datetime                                   comment 'Create Time',
    update_by        varchar(64)     default ''                 comment 'Update by',
    update_time      datetime                                   comment 'Update Time',
    remark           varchar(500)    default null               comment 'Remark',
    primary key (dict_id),
    unique (dict_type)
) engine=innodb auto_increment=100 comment = '字典类型';

insert into sys_dict_type values(1,  '用户性别', 'sys_user_sex',        '0', 'admin', sysdate(), '', null, '用户性别列');
insert into sys_dict_type values(2,  '菜单状态', 'sys_show_hide',       '0', 'admin', sysdate(), '', null, '菜单状态列');
insert into sys_dict_type values(3,  '系统开关', 'sys_normal_disable',  '0', 'admin', sysdate(), '', null, '系统开关列');
insert into sys_dict_type values(4,  '任务状态', 'sys_job_status',      '0', 'admin', sysdate(), '', null, '任务状态列');
insert into sys_dict_type values(5,  '任务分组', 'sys_job_group',       '0', 'admin', sysdate(), '', null, '任务分组列');
insert into sys_dict_type values(6,  '系统是否', 'sys_yes_no',          '0', 'admin', sysdate(), '', null, '系统是否列');
insert into sys_dict_type values(7,  '通知类型', 'sys_notice_type',     '0', 'admin', sysdate(), '', null, '通知类型列');
insert into sys_dict_type values(8,  '通知状态', 'sys_notice_status',   '0', 'admin', sysdate(), '', null, '通知状态列');
insert into sys_dict_type values(9,  '操作类型', 'sys_oper_type',       '0', 'admin', sysdate(), '', null, '操作类型列');
insert into sys_dict_type values(10, '系统状态', 'sys_common_status',   '0', 'admin', sysdate(), '', null, '登录状态列');


-- ----------------------------
-- 12、字典数据
-- ----------------------------
drop table if exists sys_dict_data;
create table sys_dict_data
(
    dict_code        bigint(20)      not null auto_increment    comment '字典编码',
    dict_sort        int(4)          default 0                  comment '字典排序',
    dict_label       varchar(100)    default ''                 comment '字典标签',
    dict_value       varchar(100)    default ''                 comment '字典键值',
    dict_type        varchar(100)    default ''                 comment '字典类型',
    css_class        varchar(100)    default null               comment '样式属性（其他样式扩展）',
    list_class       varchar(100)    default null               comment '格回显样式',
    is_default       char(1)         default 'N'                comment '是否默认（Y是 N否）',
    status           char(1)         default '0'                comment 'Status(0Normal 1Disable)',
    create_by        varchar(64)     default ''                 comment 'Creator',
    create_time      datetime                                   comment 'Create Time',
    update_by        varchar(64)     default ''                 comment 'Update by',
    update_time      datetime                                   comment 'Update Time',
    remark           varchar(500)    default null               comment 'Remark',
    primary key (dict_code)
) engine=innodb auto_increment=100 comment = '字典数据';

insert into sys_dict_data values(1,  1,  '男',       '0',       'sys_user_sex',        '',   '',        'Y', '0', 'admin', sysdate(), '', null, '性别男');
insert into sys_dict_data values(2,  2,  '女',       '1',       'sys_user_sex',        '',   '',        'N', '0', 'admin', sysdate(), '', null, '性别女');
insert into sys_dict_data values(3,  3,  '未知',     '2',       'sys_user_sex',        '',   '',        'N', '0', 'admin', sysdate(), '', null, '性别未知');
insert into sys_dict_data values(4,  1,  '显示',     '0',       'sys_show_hide',       '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, '显示菜单');
insert into sys_dict_data values(5,  2,  '隐藏',     '1',       'sys_show_hide',       '',   'danger',  'N', '0', 'admin', sysdate(), '', null, '隐藏菜单');
insert into sys_dict_data values(6,  1,  '正常',     '0',       'sys_normal_disable',  '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, '正常状态');
insert into sys_dict_data values(7,  2,  '停用',     '1',       'sys_normal_disable',  '',   'danger',  'N', '0', 'admin', sysdate(), '', null, '停用状态');
insert into sys_dict_data values(8,  1,  '正常',     '0',       'sys_job_status',      '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, '正常状态');
insert into sys_dict_data values(9,  2,  '暂停',     '1',       'sys_job_status',      '',   'danger',  'N', '0', 'admin', sysdate(), '', null, '停用状态');
insert into sys_dict_data values(10, 1,  '默认',     'DEFAULT', 'sys_job_group',       '',   '',        'Y', '0', 'admin', sysdate(), '', null, '默认分组');
insert into sys_dict_data values(11, 2,  '系统',     'SYSTEM',  'sys_job_group',       '',   '',        'N', '0', 'admin', sysdate(), '', null, '系统分组');
insert into sys_dict_data values(12, 1,  '是',       'Y',       'sys_yes_no',          '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, '系统默认是');
insert into sys_dict_data values(13, 2,  '否',       'N',       'sys_yes_no',          '',   'danger',  'N', '0', 'admin', sysdate(), '', null, '系统默认否');
insert into sys_dict_data values(14, 1,  '通知',     '1',       'sys_notice_type',     '',   'warning', 'Y', '0', 'admin', sysdate(), '', null, '通知');
insert into sys_dict_data values(15, 2,  '公告',     '2',       'sys_notice_type',     '',   'success', 'N', '0', 'admin', sysdate(), '', null, '公告');
insert into sys_dict_data values(16, 1,  '正常',     '0',       'sys_notice_status',   '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, '正常状态');
insert into sys_dict_data values(17, 2,  '关闭',     '1',       'sys_notice_status',   '',   'danger',  'N', '0', 'admin', sysdate(), '', null, '关闭状态');
insert into sys_dict_data values(18, 99, '其他',     '0',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', sysdate(), '', null, '其他操作');
insert into sys_dict_data values(19, 1,  '新增',     '1',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', sysdate(), '', null, '新增操作');
insert into sys_dict_data values(20, 2,  '修改',     '2',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', sysdate(), '', null, '修改操作');
insert into sys_dict_data values(21, 3,  '删除',     '3',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', sysdate(), '', null, '删除操作');
insert into sys_dict_data values(22, 4,  '授权',     '4',       'sys_oper_type',       '',   'primary', 'N', '0', 'admin', sysdate(), '', null, '授权操作');
insert into sys_dict_data values(23, 5,  '导出',     '5',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', sysdate(), '', null, '导出操作');
insert into sys_dict_data values(24, 6,  '导入',     '6',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', sysdate(), '', null, '导入操作');
insert into sys_dict_data values(25, 7,  '强退',     '7',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', sysdate(), '', null, '强退操作');
insert into sys_dict_data values(26, 8,  '生成代码', '8',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', sysdate(), '', null, '生成操作');
insert into sys_dict_data values(27, 9,  '清空数据', '9',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', sysdate(), '', null, '清空操作');
insert into sys_dict_data values(28, 1,  '成功',     '0',       'sys_common_status',   '',   'primary', 'N', '0', 'admin', sysdate(), '', null, '正常状态');
insert into sys_dict_data values(29, 2,  '失败',     '1',       'sys_common_status',   '',   'danger',  'N', '0', 'admin', sysdate(), '', null, '停用状态');


-- ----------------------------
-- 13、参数配置
-- ----------------------------
drop table if exists sys_config;
create table sys_config (
                            config_id         int(5)          not null auto_increment    comment '参数主键',
                            config_name       varchar(100)    default ''                 comment '参数名称',
                            config_key        varchar(100)    default ''                 comment '参数键名',
                            config_value      varchar(500)    default ''                 comment '参数键值',
                            config_type       char(1)         default 'N'                comment '系统内置（Y是 N否）',
                            create_by         varchar(64)     default ''                 comment 'Creator',
                            create_time       datetime                                   comment 'Create Time',
                            update_by         varchar(64)     default ''                 comment 'Update by',
                            update_time       datetime                                   comment 'Update Time',
                            remark            varchar(500)    default null               comment 'Remark',
                            primary key (config_id)
) engine=innodb auto_increment=100 comment = '参数配置';

insert into sys_config values(1, '主框架页-默认皮肤样式名称',     'sys.index.skinName',            'skin-blue',     'Y', 'admin', sysdate(), '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow' );
insert into sys_config values(2, 'User Management-账号初始Password',         'sys.user.initPassword',         '123456',        'Y', 'admin', sysdate(), '', null, '初始化Password 123456' );
insert into sys_config values(3, '主框架页-侧边栏主题',           'sys.index.sideTheme',           'theme-dark',    'Y', 'admin', sysdate(), '', null, '深色主题theme-dark，浅色主题theme-light' );
insert into sys_config values(4, '账号自助-验证码开关',           'sys.account.captchaEnabled',    'true',          'Y', 'admin', sysdate(), '', null, '是否开启验证码功能（true开启，false关闭）');
insert into sys_config values(5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser',      'false',         'Y', 'admin', sysdate(), '', null, '是否开启注册用户功能（true开启，false关闭）');
insert into sys_config values(6, '用户登录-黑名单列',           'sys.login.blackIPList',         '',              'Y', 'admin', sysdate(), '', null, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');


-- ----------------------------
-- 14、系统访问记录
-- ----------------------------
drop table if exists sys_logininfor;
create table sys_logininfor (
                                info_id        bigint(20)     not null auto_increment   comment '访问ID',
                                user_name      varchar(50)    default ''                comment 'Account',
                                ipaddr         varchar(128)   default ''                comment '登录IP地址',
                                login_location varchar(255)   default ''                comment '登录地点',
                                browser        varchar(50)    default ''                comment '浏览器类型',
                                os             varchar(50)    default ''                comment '操作系统',
                                status         char(1)        default '0'               comment '登录状态（0成功 1失败）',
                                msg            varchar(255)   default ''                comment '提示消息',
                                login_time     datetime                                 comment '访问时间',
                                primary key (info_id),
                                key idx_sys_logininfor_s  (status),
                                key idx_sys_logininfor_lt (login_time)
) engine=innodb auto_increment=100 comment = '系统访问记录';


-- ----------------------------
-- 15、Jobs调度
-- ----------------------------
drop table if exists sys_job;
create table sys_job (
                         job_id              bigint(20)    not null auto_increment    comment '任务ID',
                         job_name            varchar(64)   default ''                 comment '任务名称',
                         job_group           varchar(64)   default 'DEFAULT'          comment '任务组名',
                         invoke_target       varchar(500)  not null                   comment '调用目标字符串',
                         cron_expression     varchar(255)  default ''                 comment 'cron执行达式',
                         misfire_policy      varchar(20)   default '3'                comment '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
                         concurrent          char(1)       default '1'                comment '是否并发执行（0允许 1禁止）',
                         status              char(1)       default '0'                comment '状态（0正常 1暂停）',
                         create_by           varchar(64)   default ''                 comment 'Creator',
                         create_time         datetime                                 comment 'Create Time',
                         update_by           varchar(64)   default ''                 comment 'Update by',
                         update_time         datetime                                 comment 'Update Time',
                         remark              varchar(500)  default ''                 comment 'Remark信息',
                         primary key (job_id, job_name, job_group)
) engine=innodb auto_increment=100 comment = 'Jobs调度';

insert into sys_job values(1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams',        '0/10 * * * * ?', '3', '1', '1', 'admin', sysdate(), '', null, '');
insert into sys_job values(2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')',  '0/15 * * * * ?', '3', '1', '1', 'admin', sysdate(), '', null, '');
insert into sys_job values(3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)',  '0/20 * * * * ?', '3', '1', '1', 'admin', sysdate(), '', null, '');


-- ----------------------------
-- 16、Jobs调度日志
-- ----------------------------
drop table if exists sys_job_log;
create table sys_job_log (
                             job_log_id          bigint(20)     not null auto_increment    comment '任务日志ID',
                             job_name            varchar(64)    not null                   comment '任务名称',
                             job_group           varchar(64)    not null                   comment '任务组名',
                             invoke_target       varchar(500)   not null                   comment '调用目标字符串',
                             job_message         varchar(500)                              comment '日志信息',
                             status              char(1)        default '0'                comment '执行状态（0正常 1失败）',
                             exception_info      varchar(2000)  default ''                 comment '异常信息',
                             create_time         datetime                                  comment 'Create Time',
                             primary key (job_log_id)
) engine=innodb comment = 'Jobs调度日志';


-- ----------------------------
-- 17、Notice
-- ----------------------------
drop table if exists sys_notice;
create table sys_notice (
                            notice_id         int(4)          not null auto_increment    comment '公告ID',
                            notice_title      varchar(50)     not null                   comment '公告标题',
                            notice_type       char(1)         not null                   comment '公告类型（1通知 2公告）',
                            notice_content    longblob        default null               comment '公告内容',
                            status            char(1)         default '0'                comment '公告状态（0正常 1关闭）',
                            create_by         varchar(64)     default ''                 comment 'Creator',
                            create_time       datetime                                   comment 'Create Time',
                            update_by         varchar(64)     default ''                 comment 'Update by',
                            update_time       datetime                                   comment 'Update Time',
                            remark            varchar(255)    default null               comment 'Remark',
                            primary key (notice_id)
) engine=innodb auto_increment=10 comment = 'Notice';

-- ----------------------------
-- 初始化-公告信息数据
-- ----------------------------
insert into sys_notice values('1', '温馨提醒：2018-07-01 Admin新版本发布啦', '2', '新版本内容', '0', 'admin', sysdate(), '', null, 'Admin');
insert into sys_notice values('2', '维护通知：2018-07-01 Admin系统凌晨维护', '1', '维护内容',   '0', 'admin', sysdate(), '', null, 'Admin');


-- ----------------------------
-- 18、代码生成业务
-- ----------------------------
drop table if exists gen_table;
create table gen_table (
                           table_id          bigint(20)      not null auto_increment    comment '编号',
                           table_name        varchar(200)    default ''                 comment '名称',
                           table_comment     varchar(500)    default ''                 comment '描述',
                           sub_table_name    varchar(64)     default null               comment '关联子的名',
                           sub_table_fk_name varchar(64)     default null               comment '子关联的外键名',
                           class_name        varchar(100)    default ''                 comment '实体类名称',
                           tpl_category      varchar(200)    default 'crud'             comment '使用的模板（crud单操作 tree树操作）',
                           tpl_web_type      varchar(30)     default ''                 comment '前端模板类型（element-ui模版 element-plus模版）',
                           package_name      varchar(100)                               comment '生成包路径',
                           module_name       varchar(30)                                comment '生成模块名',
                           business_name     varchar(30)                                comment '生成业务名',
                           function_name     varchar(50)                                comment '生成功能名',
                           function_author   varchar(50)                                comment '生成功能作者',
                           gen_type          char(1)         default '0'                comment '生成代码方式（0zip压缩包 1自定义路径）',
                           gen_path          varchar(200)    default '/'                comment '生成路径（不填默认项目路径）',
                           options           varchar(1000)                              comment '其它生成选项',
                           create_by         varchar(64)     default ''                 comment 'Creator',
                           create_time 	    datetime                                   comment 'Create Time',
                           update_by         varchar(64)     default ''                 comment 'Update by',
                           update_time       datetime                                   comment 'Update Time',
                           remark            varchar(500)    default null               comment 'Remark',
                           primary key (table_id)
) engine=innodb auto_increment=1 comment = '代码生成业务';


-- ----------------------------
-- 19、代码生成业务字段
-- ----------------------------
drop table if exists gen_table_column;
create table gen_table_column (
                                  column_id         bigint(20)      not null auto_increment    comment '编号',
                                  table_id          bigint(20)                                 comment '归属编号',
                                  column_name       varchar(200)                               comment '列名称',
                                  column_comment    varchar(500)                               comment '列描述',
                                  column_type       varchar(100)                               comment '列类型',
                                  java_type         varchar(500)                               comment 'JAVA类型',
                                  java_field        varchar(200)                               comment 'JAVA字段名',
                                  is_pk             char(1)                                    comment '是否主键（1是）',
                                  is_increment      char(1)                                    comment '是否自增（1是）',
                                  is_required       char(1)                                    comment '是否必填（1是）',
                                  is_insert         char(1)                                    comment '是否为插入字段（1是）',
                                  is_edit           char(1)                                    comment '是否编辑字段（1是）',
                                  is_list           char(1)                                    comment '是否列字段（1是）',
                                  is_query          char(1)                                    comment '是否查询字段（1是）',
                                  query_type        varchar(200)    default 'EQ'               comment '查询方式（等于、不等于、大于、小于、范围）',
                                  html_type         varchar(200)                               comment '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
                                  dict_type         varchar(200)    default ''                 comment '字典类型',
                                  sort              int                                        comment '排序',
                                  create_by         varchar(64)     default ''                 comment 'Creator',
                                  create_time 	    datetime                                   comment 'Create Time',
                                  update_by         varchar(64)     default ''                 comment 'Update by',
                                  update_time       datetime                                   comment 'Update Time',
                                  primary key (column_id)
) engine=innodb auto_increment=1 comment = '代码生成业务字段';