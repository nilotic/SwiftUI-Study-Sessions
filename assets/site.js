document.addEventListener("DOMContentLoaded", () => {
  const revealTargets = document.querySelectorAll("[data-reveal]");

  if ("IntersectionObserver" in window) {
    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add("is-visible");
          observer.unobserve(entry.target);
        }
      });
    }, { threshold: 0.12 });

    revealTargets.forEach((target) => observer.observe(target));
  } else {
    revealTargets.forEach((target) => target.classList.add("is-visible"));
  }

  const buttons = Array.from(document.querySelectorAll("[data-filter]"));
  const cards = Array.from(document.querySelectorAll("[data-session-card]"));

  if (!buttons.length || !cards.length) {
    return;
  }

  buttons.forEach((button) => {
    button.addEventListener("click", () => {
      const selected = button.dataset.filter;

      buttons.forEach((item) => item.classList.toggle("is-active", item === button));
      cards.forEach((card) => {
        const matches = selected === "all" || card.dataset.track === selected;
        card.classList.toggle("is-hidden", !matches);
      });
    });
  });
});

