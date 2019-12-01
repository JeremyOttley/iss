(ns iss.core)

(require '[clojure.data.json :as json])

(defn message 
  [& strings] 
  (println (clojure.string/join "\n" strings)))

(message "Astronauts [astros]"
         "Test [test]")
(println "Enter ISS option: ")
(def user-input (read-line))

(def endpoint (str "/" user-input ".json"))
(def astro-json (json/read-str (slurp (str "http://api.open-notify.org" endpoint))))

(json/pprint-json astro-json)

