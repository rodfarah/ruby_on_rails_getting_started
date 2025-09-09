class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  def index
    @products = Product.all
  end

  def show
  end

  # o método new é como "me mostre o formulário vazio"
  # Por padrão, se você não escrever render ou redirect_to, o Rails vai renderizar automaticamente
  # a view correspondente ao nome do método: new.html.erb.
  def new
    @product = Product.new
  end


  # O método create é executando quando enviamos um formulário pelo html.
  # Ele cria um objeto product pelos parâmetros enviados pelo formulário,
  # se os dados forem válidos, há um redirect para o método show,
  # caso contrário, renderiza novamente o formulário pelo método new,
  # expondo os erros.
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end


  private
  # criar o método abaixo para o before_action
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.expect(product: [ :name ])
  end
end
