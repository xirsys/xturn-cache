defmodule Xirsys.XTurn.Cache.MixProject do
  use Mix.Project

  def project do
    [
      app: :xturn_cache,
      version: "0.1.0",
      elixir: "~> 1.6.6",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "Cache with TTL for the XTurn server.",
      source_url: "https://github.com/xirsys/xturn-cache",
      homepage_url: "https://xturn.me",
      package: package(),
      docs: [
        extras: ["README.md", "LICENCE"],
        main: "readme"
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    []
  end

  defp package do
    %{
      maintainers: ["Jahred Love"],
      licenses: ["Apache 2.0"],
      organization: ["Xirsys"],
      links: %{"Github" => "https://github.com/xirsys/xturn-cache"}
    }
  end
end
