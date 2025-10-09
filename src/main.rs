mod ui;

fn main() -> color_eyre::Result<()> {
    color_eyre::install()?;
    let terminal = ratatui::init();
    let result = ui::App::new().run(terminal);
    ratatui::restore();
    result
}
