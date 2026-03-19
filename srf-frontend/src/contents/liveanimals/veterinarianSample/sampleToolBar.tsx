import { useState } from "react";
import { VeterinarianSampleFormModal } from "./formSampleModal";
import greenPlusIcon from "../../../assets/greenPlus.svg";

export function SampleToolBar({ refresh }: { refresh: () => void }) {
    const [showCreateModal, setShowCreateModal] = useState(false);

    return (
        <>
            <button
                onClick={() => setShowCreateModal(true)}
                className="flex items-center justify-center bg-form-bg w-10 rounded-t-xl cursor-pointer"
                title="Novo Registro"
            >
                <img src={greenPlusIcon} alt="Novo Registro" className="w-4 h-4" />
            </button>
            {showCreateModal && (
                <VeterinarianSampleFormModal
                    close={() => setShowCreateModal(false)}
                    refresh={refresh}
                />
            )}
        </>
    );
}