﻿/*
 * XCoder v4.5.2011.1108
 * 作者：nnhy/NEWLIFE
 * 时间：2011-11-14 17:39:37
 * 版权：版权所有 (C) 新生命开发团队 2011
*/
﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewLife.CommonEntity;
using NewLife.Web;

public partial class Common_TemplateItem : MyEntityList
{
    /// <summary>实体类型</summary>
    public override Type EntityType { get { return typeof(TemplateItem); } set { base.EntityType = value; } }

    /// <summary>模版编号</summary>
    public Int32 TemplateID { get { return WebHelper.RequestInt("TemplateID"); } }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (TemplateID > 0)
            {
                Template entity = Template.FindByID(TemplateID);
                if (entity == null)
                    WebHelper.AlertAndEnd("非法参数！");
                else
                {
                    lbAdd.Url += "?TemplateID=" + TemplateID;

                    lnkReturn.Text = lnkReturn.ToolTip = String.Format("返回模版管理【{0}】", entity.Name);
                    lnkReturn.Visible = true;
                }
            }
            else
                lbAdd.Visible = false;
        }
    }

    protected void ods_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["templateid"] = TemplateID;
    }
}