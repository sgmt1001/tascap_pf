class OrganizationsController < ApplicationController


  def new
    @organization = Organization.new
  end

  def index
    @organization = Organization.all
  end

  def show
    @organization = Organization.find(params[:id])
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.user_id = current_user.id
    if @organization.save
      Belonging.create(organization_id:@organization.id,user_id:current_user.id)#create実行時にorganization作成者をbelongingに自動で追加
      redirect_to organization_path(@organization)
    else
      render 'index'
    end
  end

  def edit
    @organization = Organization.find(params[:id])
    if current_user.id == @organization.user_id
      render :edit
    else
      redirect_to organization_path(@organization)
    end
  end

  def update
    @organization = Organization.find(params[:id])
    if @organization.update(organization_params)
      redirect_to organization_path(@organization)
    else
      render "edit"
    end
  end

  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy
    redirect_to organizations_path
  end

  def belonging
    @organization = Organization.find(params[:id])
  end

  def invite
    @invite = Belonging.create(organization_id:params[:id],user_id:params[:user_id])
    @invite.save
    redirect_to organizations_path
  #belongにcheckカラムをつくる true , false, から=見てない
  #emailからUserを探す
  #organizationのidもひつよう
  #Belongingに登録,checkをから
  #userが承認したらcheckをtrue
  #checkでorganizationの閲覧許可判定
  end

  private
  def organization_params
    params.require(:organization).permit(:name, :introduction)
  end

end
