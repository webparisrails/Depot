ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    panel "Liste de Produit" do
      table_for Product.order('created_at desc').limit(10) do
        column "Categorie" do |a|
          link_to a.category.name, admin_category_path(a)
        end
        column "Produits" do |a|
          link_to a.title, admin_product_path(a)
        end
        column "Disponibilité" do |a|
          status_tag(a.available? ? "Disponible" : "Indisponible", (a.available ? :ok : :warning))
        end
        column "Prix" do |a|
          #link_to a.price, admin_product_path(a)
          number_to_currency a.price, :unit => "€"
        end
      end
    end
  end
end
